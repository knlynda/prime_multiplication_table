require 'spec_helper'

RSpec.describe PrimeMultiplicationTableCLI do
  describe '.run' do
    subject(:run) { described_class.run(args) }
    let(:renderer) { double }

    before do
      expect(PrimeMultiplicationTable::Renderer).to receive(:new).with(renderer_args).and_return(renderer)
      expect(renderer).to receive(:render)
    end

    context 'when args is [0]' do
      let(:args) { [0] }
      let(:renderer_args) { [2, 3, 5, 7, 11, 13, 17, 19, 23, 29] }

      it { run }
    end

    context 'when args is [1]' do
      let(:args) { [1] }
      let(:renderer_args) { [2] }

      it { run }
    end

    context 'when args is [1]' do
      let(:args) { [1] }
      let(:renderer_args) { [2] }

      it { run }
    end

    context 'when args is [5]' do
      let(:args) { [5] }
      let(:renderer_args) { [2, 3, 5, 7, 11] }

      it { run }
    end

    context 'when args is [-1]' do
      let(:args) { [-1] }
      let(:renderer_args) { [2, 3, 5, 7, 11, 13, 17, 19, 23, 29] }

      it { run }
    end

    context 'when args is ["one"]' do
      let(:args) { ['one'] }
      let(:renderer_args) { [2, 3, 5, 7, 11, 13, 17, 19, 23, 29] }

      it { run }
    end
  end
end
