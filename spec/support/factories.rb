FactoryGirl.define do

  sequence :job_title do |n|
    "#{n} title"
  end

  sequence :interest, [1,2,3].cycle do |n|
    n
  end

  sequence :city_name do |n|
    "City #{n}"
  end

  factory :job do
    title { generate(:job_title)}
    level_of_interest { generate(:interest)}
  end

  sequence :company_name do |n|
    "Company #{n}"
  end

  factory :company do
    name { generate(:company_name) }
    city { generate(:city_name) }

    factory :company_with_jobs do
      jobs { create_list(:job, 3)}
    end
  end
end
