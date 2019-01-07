require 'rom-sql'
require 'rom-repository'

rom = ROM.container(:sql, 'postgres://opencompany:secret@localhost:5432/opencompany', extensions: [:pg_json]) do |config|
  config.relation(:users) do
    schema(infer: true)
  end
end

class UserRepo < ROM::Repository[:users]
  def listall
    users.map(&:to_h)
  end

end

user_repo = UserRepo.new(rom)
puts user_repo.listall
