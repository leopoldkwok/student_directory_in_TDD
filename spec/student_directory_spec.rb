require 'student_directory'

describe 'Student Directory TDD Project' do 
	context 'print header' do
		it 'prints header here' do
			header = "The students of Makers Academy\n======================================="
			expect(print_header).to eq header
		end
	end

	context 'print_footer' do 
		it 'print footer here' do
			footer = "Overall, we have #{student_list.length} great students"
			expect(print_footer).to eq footer
		end
	end

	context 'student_name' do 
		it "print each name" do
			expect(student_name).to eq "Leo"
		end
	end

	context 'array_iteration' do 
		it "print each name" do 
			student_list.each do |student_list| end
			expect(array_iteration).to eq student_list
		end
	end

	context 'student_cohort' do 
		it "asks student for cohort" do 
			expect(ask_for_cohort).to eq "What's your cohort?"
		end

		it 'inputs a cohort' do 
			month = "August\n"
			expect(self).to receive(:gets).and_return(month)
			expect(input_month).to eq "August"
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
			expect(input_month).to eq 'You entered the wrong month name!'
		end
	end
end