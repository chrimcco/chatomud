module ChatoMud

  module CMSocket

    def rx
      input = gets
      return [:bad, nil] unless input
      return [:ok, input.strip!]
    end

    def tx(message)
      begin
        self << "#{message}\n\0"
        flush
      rescue Errno::EPIPE
        # Empty
      end
    end

    def human_address
      if closed?
        "[CLOSED]"
      else
        remote_address.inspect_sockaddr
      end
    end

  end

end