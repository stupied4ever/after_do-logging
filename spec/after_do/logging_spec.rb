module AfterDo::Logging
  describe AfterDo::Logging do
    describe '.logger' do
      subject(:logger) { described_class.logger }

      it { is_expected.to be_a(Logger) }
    end

    describe '.logger=(value)' do
      subject(:update_logger) { described_class.logger = new_logger }

      let(:new_logger) { double(:new_logger) }

      it do
        expect { update_logger }.to change {
          AfterDo::Logging.logger
        }.to(new_logger)
      end
    end
  end
end
