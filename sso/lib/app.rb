# frozen_string_literal: true

require "jwt"

JWT_SECRET = "POPUG_FOREVER_ULTIMATE_SECURE"

Popug = Struct.new(:id, :name, :avatar)

class PopugRepo
  def self.guess
    Popug.new(*POPUGI.sample)
  end

  # rubocop:disable Layout/LineLength
  POPUGI = [
    ["budgerigar", "Running Late Budgerigar",
     "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Budgerigar-strzelecki-qld.jpg/320px-Budgerigar-strzelecki-qld.jpg"],
    ["cockatoo", "Talking Out of Place Cockatoo",
     "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Eolophus_roseicapilla_-Wamboin%2C_NSW%2C_Australia_-adult-8-2cp.jpg/210px-Eolophus_roseicapilla_-Wamboin%2C_NSW%2C_Australia_-adult-8-2cp.jpg"],
    ["little-blue-macaw", "Very Excited Little Blue Macaw",
     "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/Cyanopsitta_spixii_-Vogelpark_Walsrode%2C_Walsrode%2C_Germany-1980.jpg/320px-Cyanopsitta_spixii_-Vogelpark_Walsrode%2C_Walsrode%2C_Germany-1980.jpg"],
    ["cockatiel", "Always Drunk Cockatiel",
     "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/Cockateil.jpg/195px-Cockateil.jpg"]
  ].freeze
  # rubocop:enable Layout/LineLength
end

class App < Hanami::API
  get "/sso/super-login/" do
    payload = PopugRepo.guess.to_h
    token = JWT.encode payload, JWT_SECRET, "HS256"

    redirect "#{back}?popug_token=#{token}"
  end
end
