class Questionnaire < ApplicationRecord
    has_many :order_questions
    has_many :answer_sheets
    def as_json(options = {})
        res=super
        if res["order_questions"]
            res["order_questions"].each do |question|
                if question["choice_question"]
                    question["choice_question"]["options"].each do |option|
                        option["image_url"]="http://localhost:9000"+option["image_url"]
                    end
                end
            end
        end
        res
    end
end
