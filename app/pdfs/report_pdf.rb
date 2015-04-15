require "open-uri"

class ReportPdf < Prawn::Document

  def initialize(spot)

    super()
    @spot = spot
    header
    text_content
    # table_content
    @directions = "https://maps.googleapis.com/maps/api/directions/json?origin=Toronto&destination=Montreal&avoid=highways&mode=bicycling&key=AIzaSyCGrehijmS0whBx20TDfi4lZTH4pCuIjn4"

  end
 
  def header
    text "Vacation Box", size: 30, style: :bold, color: "#000000"
    text "#{@spot.spot_name}", size: 25, style: :bold, color: "#7cb89c" 
    # text "#{@spot.phone} #{@spot.route} #{@spot.website} #{@spot.city} #{@spot.street_number}" , size: 10 
    stroke_color "#7cb89c"
    stroke_horizontal_rule 
  end


  
 
  def text_content
    image open ("https://maps.googleapis.com/maps/api/directions/json?origin=Toronto&destination=Montreal&avoid=highways&mode=bicycling&key=AIzaSyCGrehijmS0whBx20TDfi4lZTH4pCuIjn4")
    gap = 10
    y_position = cursor - 30
    bounding_box([400, y_position], :width => 100) do
          # transparent(0.5) { stroke_bounds }
          text "Things about #{@spot.spot_name}", size: 12, style: :bold, color: "#A7C8DB"    
          image open(@spot.image), width: 200, height: 200

            font_size 10
            
            text "\u2022 Ruby on Rails"
            text "\u2022 REST"
            text "\u2022 Listening to Jay's lectures"
            text "\u2022 Another skill"
            text "\u2022 More skills, more space, how long until next "
            text "\u2022 More skills"
         
    end #End skills bounding box

    bounding_box([0, y_position], :width => 390) do
      # transparent(0.5) { stroke_bounds }

        text "EXPERIENCE", size: 12, style: :bold, color: "#A7C8DB"     
          font_size 10      
          # pad_top(5) {
          #   @student.experiences.each do |x|
          #     text "#{x["job_title"].upcase}" 
          #     text "#{x["company_name"].upcase}"
          #     text "#{x["start_date"]} - #{x["end_date"]}"  
          #   end 
          #   }

        bounding_box([gap, cursor - gap], :width => 350) do
          font_size 10
          text "Nested bounding box Duis vel tortor elementum
                  ultrices tortor vel, accumsan dui. Nullam in dolor rutrum, gravida turpis euvestibulum lectus. Pellentesque aliquet dignissim justo ut fringilla.
                  Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut venenatis massa non eros venenatis aliquet. Suspendisse potenti. Mauris sed 
                  tincidunt mauris, et vulputate risus. Aliquam eget nibh at erat dignissim aliquam non et risus. Fusce mattis neque id diam pulvinar, fermentum luctus enim porttitor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.tincidunt mauris, et vulputate risus. Aliquam eget nibh at erat dignissim aliquam non et risus. Fusce mattis neque id diam pulvinar, fermentum luctus enim porttitor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos"
                
        end #End nested bounding box
    end #End experience bounding box

    y_position = cursor - 30
    bounding_box([0, y_position], :width => 350, :height => 108) do
      # transparent(0.5) { stroke_bounds }
      text "EDUCATION", size: 12, style: :bold, color: "#A7C8DB"
        font_size 10
        # pad_top(5) {
        # @student.educations.each do |x|
        #   text "#{x["university_name"].upcase}" 
        #   text "#{x["degreed"].upcase}" 
        #   text "#{x["start_date"]} - #{x["end_date"]}" 
        # end 
        # }

      bounding_box([gap, cursor - gap], :width => 340, :height => 90) do
        font_size 10
      text "Duis vel tortor elementum, ultrices tortor vel, accumsan dui. Nullam in dolor rutrum, gravida turpis eu, vestibulum lectus. Pellentesque aliquet dignissim justo ut fringilla. Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut venenatis massa non eros venenatis aliquet. Suspendisse potenti. Mauris sed tincidunt mauris, et vulputate risus. Aliquam eget nibh at erat dignissim aliquam non et risus. Fusce mattis neque id diam pulvinar, fermentum luctus enim porttitor."
      end #End nested bounding box
    end #End education bounding box    
 
  end
 
end