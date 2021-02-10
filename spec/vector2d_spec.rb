require_relative "../models/vector2d"

describe Vector2D do
  context "Moving forwards" do
     it "when facing north moves Y+1" do
    v = Vector2D.new
    v.place(0.00, 0.00, Vector2D::NORTH)
    v.forward
    expect(v.y).to eq (1)
     end

     it "when facing south moves Y-1" do
    v = Vector2D.new
    v.place(0.00, 1.00, Vector2D::SOUTH)
    v.forward
    expect(v.y).to eq (0)
     end

     it "when facing east moves X+1" do
    v = Vector2D.new
    v.place(0.00, 0.00, Vector2D::EAST)
    v.forward
    expect(v.x).to eq (1)
     end

     it "when facing west moves X-1" do
    v = Vector2D.new
    v.place(1.00, 0.00, Vector2D::WEST)
    v.forward
    expect(v.x).to eq (0)
     end
  end

  context "Moving backwards" do
    it "when facing north moves Y+1" do
     v = Vector2D.new
     v.place(0.00, 1.00, Vector2D::NORTH)
     v.backward
     expect(v.y).to eq (0)
    end
 
    it "when facing south moves Y-1" do
     v = Vector2D.new
     v.place(0.00, 0.00, Vector2D::SOUTH)
     v.backward
     expect(v.y).to eq (1)
    end
 
    it "when facing east moves X+1" do
     v = Vector2D.new
     v.place(1.00, 0.00, Vector2D::EAST)
     v.backward
     expect(v.x).to eq (0)
    end
 
    it "when facing west moves X-1" do
     v = Vector2D.new
     v.place(0.00, 0.00, Vector2D::WEST)
     v.backward
     expect(v.x).to eq (1)
    end
   end

   context "Moving backwards twice" do
    it "when facing south moves Y-2" do
      v = Vector2D.new
      v.place(0.00, 0.00, Vector2D::SOUTH)
      v.backward(2)
      expect(v.y).to eq (2)
       end
   end

   context "Moving forwards twice" do
    it "when facing north moves Y-2" do
      v = Vector2D.new
      v.place(0.00, 0.00, Vector2D::NORTH)
      v.forward(2)
      expect(v.y).to eq (2)
       end
   end

   context "Directions" do
    it "when facing north right is east" do
      v = Vector2D.new
      v.place(0.00, 0.00, Vector2D::NORTH)
      expect(v.right).to be (Vector2D::EAST)
    end
    it "when facing north left is west" do
     v = Vector2D.new
     v.place(0.00, 0.00, Vector2D::NORTH)
     expect(v.left).to be (Vector2D::WEST)
   end
   end
end