# frozen_string_literal: true

require 'grape-swagger'

module MangaDex
  class API < Grape::API
    version 'v5', using: :path, vendor: 'mangadex'
    format :json
    prefix :api

    md_description = File.read(Rails.root.join('app/api/docs.md'))

    rescue_from :all do |e|
      error!(e, 400)
    end

    helpers do
      def warden
        env['warden']
      end

      def authenticated?
        return true if warden.authenticated?

        params[:access_token] && @user = User.find_by(authentication_token: params[:access_token])
      end

      def current_user
        warden.user || @user
      end
    end

    resource :manga do
      desc 'List all Manga.'
      get do
        Manga.all.attributes.slice('id', 'username', 'admin', 'mod', 'public_relations',
                                   'created_at', 'last_sign_in_at', 'website', 'bio', 'supporter', 'md_at_home', 'avatar_data')
      end
      desc 'Get a manga.'
      params do
        requires :id, type: Integer, desc: 'Manga ID.'
      end
      route_param :id do
        get do
          Manga.find(params[:id])
        end

        desc 'Get partial information about the chapters belonging to a manga.'
        get :chapters do
          Chapter.find_by(mangas_id: params[:id])
        end
      end
    end

    resource :user do
      desc 'Get a user.'
      params do
        requires :id, type: Integer, desc: 'User ID.'
      end
      route_param :id do
        get do
          User.find_by(id: params[:id]).slice('id', 'username', 'admin', 'mod', 'public_relations',
                                              'created_at', 'last_active_at', 'website', 'bio', 'supporter', 'md_at_home', 'avatar_url')
        end

        desc 'Get partial information about the chapters uploaded by the user.'
        get :chapters do
          Chapter.find_by(users_id: params[:id])
        end

        desc 'Get a user\'s website settings. (Authentication required)'
        get :settings do
          error!('You are not authenticated.', 403) unless authenticated?

          User.find_by(id: params[:id]).slice('id', 'theme', 'view_hentai', 'notify_when_updated',
                                              'show_moderated_posts', 'show_unavailable_chapters', 'shown_chapter_langs', 'excluded_tags')
        end
      end
    end

    desc 'Ping the server.'
    get :ping do
      'pong'
    end

    add_swagger_documentation info: { title: 'MangaDex', description: md_description },
                              doc_version: ENV['CURRENT_COMMIT'].to_s
  end
end
