class Genero < ApplicationRecord
    validates :nome, :descricao, presence: true

    has_many :arvores, dependent: :destroy
end
