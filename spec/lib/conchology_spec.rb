require 'spec_helper'

module Conchology
  describe Command do

    let(:echocmd) {Conchology::Command.new('echo')}
    let(:truecmd) {Conchology::Command.new('true')}
    let(:falsecmd) {Conchology::Command.new('false')}

    context 'readers' do
      describe '#command' do
        it 'returns the command string' do
          echocmd.command.should == 'echo'
        end
      end

      describe '#output' do
        it 'should be an array' do
          echocmd.output.should be_a(Array)
        end
      end

      describe '#error' do
        it 'should be an array' do
          echocmd.error.should be_a(Array)
        end
      end

      describe '#exitstatus' do
        it 'should be an integer' do
          echocmd.exitstatus.should be_a(Integer)
        end
      end

    end

    describe '#new' do
      it 'should require a command' do
        lambda {Conchology::Command.new}.should raise_error
      end

      it 'should set up the command reader' do
        Conchology::Command.new('bogus').command.should == 'bogus'
      end
    end

    describe '#run' do
      it 'should set a real exit status' do
        truecmd.exitstatus.should == -1
        truecmd.run
        truecmd.exitstatus.should == 0
      end

      it 'should populate the output array' do
        echocmd.output.length.should == 0
        echocmd.run
        echocmd.output.length.should > 0
      end

      it 'should populate the error array' do
        errorcmd = Conchology::Command.new('echo blah 1>&2')
        errorcmd.error.length.should == 0
        errorcmd.run
        errorcmd.error.length.should > 0
      end
    end
    
    describe '.run' do
      let(:classrun) { Conchology::Command.run('echo blah')}
      it 'should return a hash' do
        classrun.should be_a(Hash)
      end

      it 'should include the command exit status' do
        classrun[:exitstatus].should be_a(Integer)
      end

      it 'should include the command output' do
        classrun[:output].should be_a(Array)
        classrun[:output].length.should > 0
      end

      it 'should include the command errors' do
        classrun[:error].should be_a(Array)
        classrun[:error].length.should == 0
      end
    end
  end
end
