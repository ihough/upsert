require 'spec_helper'
describe Upsert do
  describe "type safety" do
    it "does not attempt to typecast values" do
      upsert = Upsert.new $conn, :pets
      lambda do
        upsert.row :tag_number => ''
      end.should raise_error(PG::Error, /invalid input syntax/)
    end
  end
end if ENV['ADAPTER'] == 'postgresql'
