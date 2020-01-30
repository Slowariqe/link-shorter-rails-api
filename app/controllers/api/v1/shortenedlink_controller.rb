# frozen_string_literal: true

module Api
  module V1
    class ShortenedlinkController < ApplicationController
      def index
        shortenedlinks = Shortenedlink.order('created_at DESC')
        render json: { status: 'SUCCESS',
                       message: 'Loaded links',
                       data: shortenedlinks }, status: :ok
      end

      def show
        shortenedlink = Shortenedlink.find_by shortLink: params[:id]
        render json: { status: 'SUCCESS',
                       message: 'Loaded link by ID',
                       data: shortenedlink }, status: :ok
      end
    end
  end
end
