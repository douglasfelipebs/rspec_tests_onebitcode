require 'rails_helper'

RSpec.describe "Enemies", type: :request do
  describe "PUT /enemies" do
    context "When the enemy exists" do
      let(:enemy) { create(:enemy) } 
      let(:enemy_attributes) { attributes_for(:enemy) } 

      before(:each) { put "/enemies/#{enemy.id}", params: enemy_attributes }

      it "return status code 200" do
        expect(response).to have_http_status(200)
      end
      it "updates the record" do
        expect(enemy.reload).to have_attributes(enemy_attributes)
      end
      it "returns the enemy updated" do
        expect(enemy.reload).to have_attributes(json.except('created_at', 'updated_at'))
      end
    end

    context "When the enemy does not exists" do
      let(:enemy_attributes) { attributes_for(:enemy) } 
      before(:each) { put "/enemies/0", params: enemy_attributes }
      
      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end
      it "returns a not found message" do
        expect(response.body).to match(/Couldn't find Enemy/)
      end
    end
  end

  describe 'DELETE /enemies' do
    context 'when the enemy exists' do
      let(:enemy) { create(:enemy) }
      before(:each) { delete "/enemies/#{enemy.id}" }
      it 'return status code 204' do 
        expect(response).to have_http_status(204)
      end
      it 'destroy the record' do 
        expect { enemy.reload }.to raise_error ActiveRecord::RecordNotFound
      end
    end
    
    context 'when the does not enemy exists' do
      before(:each) { delete "/enemies/0" }
      it 'return status code 404' do
        expect(response).to have_http_status(404)
      end
      it "returns a not found message" do
        expect(response.body).to match(/Couldn't find Enemy/)
      end
    end
  end

  describe 'GET /enemies' do
    let(:enemy) { create(:enemy) }
    before(:each) { delete "/enemies/#{enemy.id}" }
    it 'return status code 200'
    it 'returns a list of enemies'
  end

  describe 'POST /enemies' do
    context 'when it have valid params' do
      let(:enemy) { create(:enemy) }
      before(:each) { delete "/enemies/#{enemy.id}" }
      it 'return status code 200'
      it 'it changes the count of the database'
    end

    context 'when it does not have valid params' do
      let(:enemy) { create(:enemy) }
      before(:each) { delete "/enemies/#{enemy.id}" }
      it 'return status code 500'
      it 'return an error message'
    end
  end

  describe 'SHOW /enemies' do
    context 'when the enemy exists' do
      let(:enemy) { create(:enemy) }
      before(:each) { delete "/enemies/#{enemy.id}" }
      it 'return status code 200'
      it 'return the enemy'
    end

    context 'when the enemy does not exists' do
      let(:enemy) { create(:enemy) }
      before(:each) { delete "/enemies/#{enemy.id}" }
      it 'return status code 404'
      it 'return an error message'
    end
  end
end
