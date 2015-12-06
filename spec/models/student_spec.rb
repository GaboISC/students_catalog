require "rails_helper"

describe Student do
	
	describe "#name" do
		it "returns complete name" do
			student=Student.create!( 
				first_name: "Gabo",
				last_name: "Diaz",
				birthdate: "11/11/1993",
		    	control_number:"11460258",
		    	semester: "9" )

		    expect(student.name).to eq "Gabo Diaz"
		end
	end

	describe "validations" do
	    it "fails to save" do
	    	post = Student.new
	      	post.save
	      	expect(post).to_not be_persisted
	    end

	    it "validates presence of first_name" do
	      	post = Student.new(last_name: "Diaz", birthdate: "11/11/1993", control_number:"11460258", semester: "9")
	      	post.save
	      	expect(post.errors.full_messages).to eq(["First name can't be blank"])
	    end

	    it "validates presence of last_name" do
	      	post = Student.new(first_name: "Gabo", birthdate: "11/11/1993", control_number:"11460258", semester: "9")
	      	post.save
	      	expect(post.errors.full_messages).to eq(["Last name can't be blank"])
	    end

	    it "validates presence of birthdate" do
	      	post = Student.new(first_name: "Gabo", last_name: "Diaz", control_number:"11460258", semester: "9")
	      	post.save
	      	expect(post.errors.full_messages).to eq(["Birthdate can't be blank"])
	    end
	    it "validates presence of control_number" do
	      	post = Student.new(first_name: "Gabo", last_name: "Diaz", birthdate: "11/11/1993", semester: "9")
	      	post.save
	      	expect(post.errors.full_messages).to eq(["Control number can't be blank"])
	    end

	    it "validates presence of semester" do
	      	post = Student.new(first_name: "Gabo", last_name: "Diaz", birthdate: "11/11/1993", control_number:"11460258")
	      	post.save
	      	expect(post.errors.full_messages).to eq(["Semester can't be blank"])
	    end
	    it "validates uniqueness of first_name" do
      		Student.create(
      			first_name: "Gabo",
				last_name: "Diaz",
				birthdate: "11/11/1993",
		    	control_number:"11460258",
		    	semester: "9" )

      		post = Student.new(
      			first_name: "Gabo",
				last_name: "Diaz",
				birthdate: "11/11/1993",
		    	control_number:"11460258",
		    	semester: "9" )
      		post.save
      		expect(post.errors.full_messages).to eq(["First name has already been taken"])
    	end
  	end
end