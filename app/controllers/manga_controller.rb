# frozen_string_literal: true

class MangaController < ApplicationController
  def show
    @manga = Manga.find_by(id: params[:id])
  end
end
