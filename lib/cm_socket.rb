module ChatoMud

  module CMSocket

    def rx
      input = gets
      return [:bad, nil] unless input
      return [:ok, input.strip!]
    end

    def tx(message)
      return if closed?

      self << "#{message}\n\0"
      flush
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