require "rails_helper"


describe StudentsController do 
describe "log" do 
	it "also" do
		teacher = FactoryGirl.create(:teacher)
		login_as(teacher, :scope => :teacher)
	end
end

	describe "GET #index" do
    it "is successful" do
      	get :index

      	 expect(response.status).to eq 200
    end
  end

  describe "POST #create" do
    context "when the attributes are complete" do
      it "redirects to root path" do
        post :create, student: { first_name: "Gaboo", last_name: "last", birthdate: "1993/11/11", control_number: "11460258", semester: "9" }

        expect(response).to redirect_to(root_path)
      end
    end

     context "when the attributes are incomplete" do
      it "renders the new template" do
        post :create, student: { first_name: nil, last_name: nil, birthdate: nil, control_number: nil, semester: nil }

        expect(response).to render_template("new")
      end

      it "is unprocessable entity" do
        post :create, student: { first_name: nil, last_name: nil, birthdate: nil, control_number: nil, semester: nil }

        expect(response.status).to eq 422
      end
    end
end
	 describe "GET #edit" do
    it "is successful" do
      p = Student.create!( first_name: "Gaboo", last_name: "last", birthdate: "1993/11/11", control_number: "11460258", semester: "9" )

      get :edit, id: p.id

      expect(response.status).to eq 200
    end

    it "is not found" do
      get :edit, id: 1

      expect(response.status).to eq 404
    end
  end
  ####
  describe "PUT #update" do
    it "redirects to root path" do
      p = Student.create!( first_name: "Gaboo", last_name: "last", birthdate: "1993/11/11", control_number: "11460258", semester: "9" )

      put :update, id: p.id, student: { first_name: "Gaboo" }

      expect(response).to redirect_to(root_path)
    end

    context "when the attributes are invalid" do
      it "renders the edit view" do
        p = Student.create!( first_name: "Gaboo", last_name: "last", birthdate: "1993/11/11", control_number: "11460258", semester: "9" )

        put :update, id: p.id, student: { first_name: nil }

        expect(response).to render_template("edit")
      end

      it "renders the edit view" do
        p = Student.create!( first_name: "Gaboo", last_name: "last", birthdate: "1993/11/11", control_number: "11460258", semester: "9" )

        put :update, id: p.id, student: { first_name: nil }

        expect(response.status).to eq 422
      end
    end
  end

  describe "DELETE #destroy" do
    it "redirects to root path" do
      p = Student.create!( first_name: "Gaboo", last_name: "last", birthdate: "1993/11/11", control_number: "11460258", semester: "9" )

      delete :destroy, id: p.id

      expect(response).to redirect_to(root_path)
    end

    it "redirects returns an exception" do
      delete :destroy, id: 1

      expect(response.status).to eq 404
    end
  end
end