# frozen_string_literal: true

class SettingsController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)

    respond_to do |format|
      format.html do
        if @user.update(user_params)
          redirect_to root_path, notice: 'Profile has been updated.'
        else
          render edit, alert: 'Invalid settings.'
        end
      end
    end
  end

  private

  def user_params
    # :shown_chapter_langs *must* be last, or else Rails yells at you
    params.require(:user).permit(:email, :username, :website, :bio, :avatar, :theme, :notify_when_updated,
                                 :mdh_portlimit, :view_hentai, :show_unavailable_chapters, shown_chapter_langs: [])
  end
end
