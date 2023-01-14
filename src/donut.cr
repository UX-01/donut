module Donut
  VERSION = "0.0.1"

  p = "/usr/share/dict/words"

  begin
    File.exists?(p)
    w = [] of String
    File.open(p) do |f|
      f.each_line do |l|
        w << l.strip
      end
    end

    ri = [] of Int32
    ss = ["!", "@", "#", "$", "%", "^", "&", "*", "<", ">", ":", ".", "-", "_", "+", "=", "~"]

    # Change the number of words you want included in the passphrase
    6.times do
      ri << Random.rand(w.size)
    end

    rw = [] of String

    ri.each do |i|
      rw << w[i]
    end

    sep = "#{ss[Random.rand(ss.size)]}"

    puts "✅ Dictionary file found, generating a usable passphrase:"
    puts rw.join(sep)
    # raise "error"
  rescue ex : Exception
    puts "⛔️ #{ex.message}"
  end
end
