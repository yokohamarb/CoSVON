require_relative '../spec_helper'

describe 'Cosvon::Reader' do
   describe '#load' do
      subject(:data) { reader.load(sample) }
      let(:reader) { Cosvon::Reader.new }
      let(:sample) { <<-EOS
CoSVON:0.1
DreamCast,SEGA
HI-Saturn,Hitachi
FamiconTV,Sharp
                     EOS
      }

      it 'サンプルを Hash に変換できる' do
         expect(subject.class).to eq(Hash)
      end

      it 'HashのKeyが正しいこと' do
         expect(subject.keys).to match_array(%w(DreamCast HI-Saturn FamiconTV))
      end

      it 'Hashの値が正しいこと' do
         expect(subject["DreamCast"]).to eq("SEGA")
         expect(subject["HI-Saturn"]).to eq("Hitachi")
         expect(subject["FamiconTV"]).to eq("Sharp")
      end
   end
end

