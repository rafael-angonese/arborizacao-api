class Arvore < ApplicationRecord
  belongs_to :genero
  belongs_to :familium
  belongs_to :grupo
  belongs_to :origem
end
