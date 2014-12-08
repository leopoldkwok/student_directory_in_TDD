require 'student_directory'

describe 'Student Directory TDD Project' do 

	context 'print information' do
		it 'prints header here' do
				header = "The students of Makers Academy\n======================================="
				expect(print_header).to eq header
		end

		it 'print footer here' do
				footer = "Overall, we have #{student_list.length} great students"
				expect(print_footer).to eq footer
		end
	end

	context 'interactive menu' do 
		it 'print interactive menu' do 
				choice = "1\n"
				allow(self).to receive(:puts).with "1. Input the students\n2. Show the students\n3. Save the list to students.csv\n4. Load the list from students.csv\n9. Exit"
				allow(self).to receive(:gets).and_return(choice)
				expect(interactive_menu).to eq "1"
		end

		it 'knows that 1 is a number' do 
				expect(number_exists?("1")).to be_truthy
		end

		it 'knows that "p" is not a number' do 
				expect(number_exists?("p")).to eq nil
		end

		it 'know when user inputs 1' do 
			expect(self).to receive(:student_name)
			expect(self).to receive(:student_hobby)
			expect(self).to receive(:student_cohort)
			ask_all_questions
		end

		it 'when user inputs 9' do 
				expect(self).to receive(:exit)
				end_programme
		end
	end
 

	context 'student directory' do 

		it "has no students" do 
				expect(student_list).to eq []
		end

		it "adds a student" do 
				student = {:name => "Leopold", :cohort => :August, :hobby => "Table Tennis"}
				add(student)
				expect(student_list).to eq [student]
		end

		it 'takes a student' do 
				student = {name: "Leopold", cohort: :August, :hobby => "Table Tennis"}
				expect(student_to_s(student)).to eq 'Leopold from the August Cohort likes Table Tennis'
		end

		it "print each name" do
				%w{Leopold Jerome Ben}.each do |name|
					add({name: name, cohort: :August, hobby: "Table Tennis"})
			end
			expect(list_of_students).to eq("1.Leopold from the August Cohort likes Table Tennis\n2.Jerome from the August Cohort likes Table Tennis\n3.Ben from the August Cohort likes Table Tennis") 
			print_students
		end
	end
	
	context 'asks user for input' do 

		it "ask user for student name" do 
				name = "Leopold\n"
				expect(self).to receive(:puts).with("What's your name?")
				expect(self).to receive(:gets).and_return(name)
				expect(student_name).to eq 'Leopold'
		end

		it "ask user for hobby" do 
				hobby = "Table Tennis\n"
				expect(self).to receive(:puts).with("What's your hobby?")
				expect(self).to receive(:gets).and_return(hobby)
				expect(student_hobby).to eq 'Table Tennis'
		end

		it 'inputs a cohort' do 
				month = "August\n"
				expect(self).to receive(:puts).with("What's your cohort?")
				expect(self).to receive(:gets).and_return(month)
				expect(student_cohort).to eq "August"
		end

		it 'knows that August is a month' do
				expect(month_exists?('august')).to be true
		end

		it 'knows that Christmas is not a month' do 
				expect(month_exists?('Christmas')).not_to be true
		end


		it 'will not allow us to input the wrong month' do 
			month = "yikes\n"
			allow(self).to receive(:gets).and_return(month)
			expect(student_cohort).to eq 'You entered the wrong month name!'
		end
	end

	context 'outputting all the information' do 
		it 'outputs all student information' do 
				%w{Leopold Jerome Ben}.each do |name|
					add({name: name, cohort: :August, hobby: "Table Tennis"})
				end
				expect(self).to receive(:print_header)
				expect(self).to receive(:print_students)
				expect(self).to receive(:print_footer)
				print_everything
		end
	end
end