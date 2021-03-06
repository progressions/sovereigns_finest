class CharacterUpdateBroadcastJob < ApplicationJob
  queue_as :default

  def perform(data)
    character = Character.find(data['id'])
    if character.active
      ActionCable.server.broadcast "encounter_#{character.encounter_id}_characters", action: 'change', id: character.id, data: render_character(character)
    end
  end

  private

    def render_character(character)
      ApplicationController.renderer.render partial: "characters/character", locals: { character: character }
    end
end
