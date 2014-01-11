require_relative '../spec_helper'

describe 'CoSVON' do
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
   end
end
