# frozen_string_literal: true

module Api
  module V1
    class ShortenedlinkController < ApplicationController

      def generate_shorty
        letters = ['a'..'z', 'A'..'Z', '0'..'9'].map(&:to_a).flatten
        shorty = 5.times.map { letters.sample }.join
        shorty
      end

      # index used for testing and list all the links pairs
      def index
        shortened_link_pairs = Shortenedlink.order('created_at DESC')
        render json: { status: 'SUCCESS',
                       message: 'Loaded all link pairs',
                       data: shortened_link_pairs }, status: :ok
      end

      # show used for return a long link from a code
      def show
        long_link_answer = Shortenedlink.find_by shortLink: params[:id]
        if !long_link_answer.nil?
          render json: {  status: 'SUCCESS',
                          message: 'Loaded your long link by this code',
                          data: long_link_answer.longLink }, status: :ok
        else
          render json: {  status: 'FAIL',
                          message: 'No such short link' }, status: :ok
        end
      end

      # update used for generating a short link or returning old one
      def update
        pp(params[:id])
        short_link_answer = Shortenedlink.find_by longLink: params[:id]
        if !short_link_answer.nil?
          render json: {  status: 'SUCCESS',
                          message: 'Long link already existed ',
                          data: short_link_answer.shortLink }, status: :ok
        else
          short_link_answer = Shortenedlink.create(longLink: params[:id].to_s,
                                                   shortLink: generate_shorty)
          render json: {  status: 'SUCCESS',
                          message: 'Generated new short link',
                          data: short_link_answer.shortLink }, status: :ok
        end
      end
    end
  end
end
