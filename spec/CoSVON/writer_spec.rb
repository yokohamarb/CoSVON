require_relative '../spec_helper'

describe 'Cosvon::Writer' do
   describe '#dump' do
      subject(:data) { writer.dump(sample) }
      let(:writer) { Cosvon::Writer.new }
      context 'printable ascii only' do
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

      context 'special characters pattern' do
         let(:result) { <<-EOS
CoSVON:0.1
comma,"[,]"
dq,"[""]"
n,"[\n]"
tab,[\t]
                        EOS
         }

         let(:sample) { 
            {
               "comma"=>"[,]",
               "dq"=>'["]',
               "n"=>"[\n]",
               "tab"=>"[\t]",
            }
         }

         it 'サンプルをdumpしたら元のデータが返ること' do
            expect(subject).to eq(result)
         end
      end
   end
end
