require_relative '../spec_helper'

describe 'Cosvon::Writer' do
   describe '#dump' do
      subject(:data) { writer.dump(sample) }
      let(:writer) { Cosvon::Writer.new }
      let(:result) { <<-EOS
CoSVON:0.1
DreamCast,SEGA
HI-Saturn,Hitachi
FamiconTV,Sharp
                     EOS
      }

      let(:sample) { 
         {
            "DreamCast"=>"SEGA",
            "HI-Saturn"=>"Hitachi",
            "FamiconTV"=>"Sharp",
         }
      }

      it 'サンプルをdumpしたら元のデータが返ること' do
         expect(subject).to eq(result)
      end
   end
end
