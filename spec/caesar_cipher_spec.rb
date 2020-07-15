require './Caesar_Cipher.rb'

describe "#caesar_cipher" do
    it "Each letter slid down the aplhabet an identified number of characters. skips non-alphanumeric characters." do
        expect(caesar_cipher("What a string!", 5)).to eql("Bmfy f xywnsl!")
    end

    it "If the slide rule puts the character beyond 'z' the method goes around the 'U' to the beginning of the alphabet" do
        expect(caesar_cipher("turtle", 7)).to eql("abyasl")
    end

    it "Remains case sensitive" do
        expect(caesar_cipher("ZzZz", 3)).to eql("CcCc")
    end

    it "Can take a negative value as an incrimator" do
        expect(caesar_cipher("CcCc", -2)).to eql("AaAa")
    end
end
