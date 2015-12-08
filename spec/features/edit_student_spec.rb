require "rails_helper"
#editar estudiante
feature "Edit student" do
	scenario "successfully" do
		visit "/teachers/sign_in"

		click_link "Sign up"

			fill_in "Email", with: "person@email.com"
			fill_in "Password", with: "12345678"
			fill_in "Password confirmation", with: "12345678"

			click_on "Sign up"

		click_on "Crear nuevo estudiante"
		
			fill_in "Nombre(s)", with: "Lolita"
			fill_in "Apellidos", with: "Pérez"
			fill_in "Número de control", with: "11460239"
			fill_in "Semestre", with: "9"

			click_on "Guardar"
		
			click_on "Editar"

			fill_in "Apellidos", with: "López"
			fill_in "Número de control", with: "1054678"
			fill_in "Semestre", with: "10"

			click_on "Guardar"
	

			expect(current_path).to eq "/"
			expect(page).to have_content "Student was successfully updated."
	end
	scenario "unsuccessfully" do
		visit "/teachers/sign_in"

		click_link "Sign up"

			fill_in "Email", with: "person@email.com"
			fill_in "Password", with: "12345678"
			fill_in "Password confirmation", with: "12345678"

			click_on "Sign up"

		click_on "Crear nuevo estudiante"
		
			fill_in "Nombre(s)", with: "Lolita"
			fill_in "Apellidos", with: "Pérez"
			fill_in "Número de control", with: "11460239"
			fill_in "Semestre", with: "9"

			click_on "Guardar"
		
			click_on "Editar"
		
			fill_in "Nombre(s)", with: ""
			fill_in "Apellidos", with: ""
			fill_in "Número de control", with: ""
			fill_in "Semestre", with: ""

			click_on "Guardar"
			
			expect(current_path).to eq "/students/1"
			expect(page).to have_content "First name can't be blank"
    		expect(page).to have_content "Last name can't be blank"
    		expect(page).to have_content "Control number can't be blank"
    		expect(page).to have_content "Semester can't be blank"
	end
end

