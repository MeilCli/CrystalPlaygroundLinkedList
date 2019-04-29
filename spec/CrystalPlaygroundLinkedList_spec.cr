require "./spec_helper"

describe CrystalPlaygroundLinkedList do
  describe "CrystalPlaygroundLinkedList::LinkedList" do
    describe "#add_first" do
      it "add first to empty list" do
        list = new_list
        list.size.should eq 0

        list.add_first 20

        list.size.should eq 1
        list.first.should eq 20
        list.last.should eq 20
        list.find(at: 0).should eq 20
      end

      it "add first to non empty list" do
        list = new_list
        list.add_first 10
        list.size.should eq 1

        list.add_first 20

        list.size.should eq 2
        list.first.should eq 20
        list.last.should eq 10
        list.find(at: 0).should eq 20
        list.find(at: 1).should eq 10
      end
    end

    describe "#add_last" do
      it "add last to empty list" do
        list = new_list
        list.size.should eq 0

        list.add_last 20

        list.size.should eq 1
        list.first.should eq 20
        list.last.should eq 20
        list.find(at: 0).should eq 20
      end

      it "add last to non empty list" do
        list = new_list
        list.add_last 10
        list.size.should eq 1

        list.add_last 20

        list.size.should eq 2
        list.first.should eq 10
        list.last.should eq 20
        list.find(at: 0).should eq 10
        list.find(at: 1).should eq 20
      end
    end

    describe "#add" do
      it "add first" do
        list = new_list
        list.add_first 10
        list.size.should eq 1

        list.add 20, at: 0

        list.size.should eq 2
        list.first.should eq 20
        list.last.should eq 10
        list.find(at: 0).should eq 20
        list.find(at: 1).should eq 10
      end

      it "add last" do
        list = new_list
        list.add_first 10
        list.size.should eq 1

        list.add 20, at: 1

        list.size.should eq 2
        list.first.should eq 10
        list.last.should eq 20
        list.find(at: 0).should eq 10
        list.find(at: 1).should eq 20
      end

      it "add index" do
        list = new_list
        list.add_last 10
        list.add_last 20
        list.add_last 30
        list.size.should eq 3

        list.add 15, at: 1

        list.size.should eq 4
        list.first.should eq 10
        list.last.should eq 30
        list.find(at: 0).should eq 10
        list.find(at: 1).should eq 15
        list.find(at: 2).should eq 20
        list.find(at: 3).should eq 30
      end

      it "add out of range" do
        expect_raises(Exception) do
          list = new_list
          list.add 10, at: -1
        end
        expect_raises(Exception) do
          list = new_list
          list.add 10, at: 1
        end
      end
    end

    describe "#first" do
      it "get" do
        list = new_list
        list.add_first 10

        list.first.should eq 10
      end

      it "nil" do
        list = new_list
        list.first.should be_nil
      end
    end

    describe "#last" do
      it "get" do
        list = new_list
        list.add_first 10

        list.last.should eq 10
      end

      it "nil" do
        list = new_list
        list.last.should be_nil
      end
    end

    describe "find" do
      it "test" do
        list = new_list
        list.add_last 10
        list.add_last 20
        list.add_last 30

        list.find(at: 0).should eq 10
        list.find(at: 1).should eq 20
        list.find(at: 2).should eq 30
      end
    end
  end
end
