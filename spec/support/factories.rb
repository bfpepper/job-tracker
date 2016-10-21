FactoryGirl.define do

  sequence :title do |n|
    "#{n} title"
  end

  factory :category do
    title
  end

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

  sequence :first_name do |n|
    "first #{n}"
  end

  sequence :last_name do |n|
    "last #{n}"
  end

  sequence :position do |n|
    "position #{n}"
  end

  sequence :email do |n|
    "someone#{n}@example.com"
  end

  factory :contact do
    first_name
    last_name
    position
    email
    company { create(:company)}
  end
end
