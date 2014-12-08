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

		it 'asks for all information' do 

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
	
	context 'user for input' do 

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
end