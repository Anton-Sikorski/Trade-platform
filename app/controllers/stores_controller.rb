# frozen_string_literal: true

class StoresController < InheritedResources::Base
  private

    def store_params
      params.require(:store).permit(:name)
    end
end
