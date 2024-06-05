class CvValidator
  def initialize(job_application)
    @job_application = job_application
  end

  def validate
    response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [{ role: "user", content: chat_message}],
        temperature: 0.7,
      })

    response_content = response.dig("choices", 0, "message", "content")

    response_content.split(',').map(&:strip).each do |jar_id|
      JobApplicationRequirement.find_by(id: jar_id)&.satisfy!
    end

    job_application.update(cv_processed_at: Time.current)
  end

  private

  attr_reader :job_application

  def chat_message
    "Za tekst koji predstavlja CV od kandidata za posao provjeri zadovoljava li sljedeće uvijete koji su definirani identifikatorom:\n
     #{requirements_string}\n
     CV:\n
     #{job_application.cv_text}\n
     Na kraju mi vrati isključivo identifikatore od kriterija koje je zadovoljio temeljem unesenog CV-a, odvojene zarezom i ništa više.
    "
  end

  def requirements_string
    final_string  = ""

    job_application.job_application_requirements.each do |j_req|
      final_string += "#{j_req.id} - #{j_req.position_criterium.criteria_value}\n"
    end

    final_string
  end

  def client
    @client ||= OpenAI::Client.new(
      access_token: "",
      log_errors: true
    )
  end
end