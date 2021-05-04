# frozen_string_literal: true

require 'grape-swagger'

module MangaDex
  class API < Grape::API
    version 'v5', using: :path, vendor: 'mangadex'
    format :json
    prefix :api

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
          User.find_by(id: params[:id]).attributes.slice('id', 'username', 'admin', 'mod', 'public_relations',
                                                         'created_at', 'last_sign_in_at', 'website', 'bio', 'supporter', 'md_at_home', 'avatar')
        end

        desc 'Get partial information about the chapters uploaded by the user.'
        get :chapters do
          Chapter.find_by(users_id: params[:id])
        end

        desc 'Get a user\'s website settings. (Authentication required)'
        get :settings do
          error!('You are not authenticated.', 403) unless authenticated?

          User.find_by(id: params[:id]).attributes.slice('id', 'view_hentai', 'notify_when_updated',
                                                         'show_moderated_posts', 'show_unavailable_chapters', 'shown_chapter_langs', 'excluded_tags')
        end
      end
    end

    add_swagger_documentation info: { title: 'MangaDex', description: 'Read manga online for free at MangaDex with no ads, high quality images and support scanlation groups!' },
                              doc_version: ENV['CURRENT_COMMIT'].to_s
  end
end
