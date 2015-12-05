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
end