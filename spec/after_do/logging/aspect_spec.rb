module AfterDo::Logging
  describe Aspect do
    subject(:aspect) { described_class.new(klass, logger) }

    let(:klass) { Class.new.extend(AfterDo) }
    let(:method) { :inspect }
    let(:logger) { double(:logger, info: nil) }

    describe '#log_start' do
      subject(:log_start) { aspect.log_start(method) }

      it 'applies the advice before target method invocation' do
        expect(klass).to receive(:before).with(method)

        log_start
      end

      it 'calls logger when instance invokes advised method' do
        expect(logger).to receive(:info)

        log_start
        klass.new.inspect
      end
    end

    describe '#log_finish' do
      subject(:log_finish) { aspect.log_finish(method) }

      it 'applies the advice after target method invocation' do
        expect(klass).to receive(:after).with(method)

        log_finish
      end

      it 'calls logger when instance invokes advised method' do
        expect(logger).to receive(:info)

        log_finish
        klass.new.inspect
      end
    end
  end
end
