source("scripts/render_functions.R")

# Personal header with information and photo
newheader <- makeheader(NULL, "Lodewic", "van Twillert", "+31625454401", "lodewic.vantwillert@gmail.com",
                        photo =NULL)

# Education section
education_items <- c(cventry("2015-2017", "MSc Econometrics", "UvA", "Amsterdam", "", "Big data business analytics\\\\ Focus on Machine learning"),
                     cventry("2012-2014", "BSc Econometrics", "UvA", "Amsterdam", "", "Minor computational programming"),
                     cventry("2004-2010", "Bilingual VWO", "'t Atrium", "Amersfoort", "", "Including IB English"))
education_section <- NewSection("Education", education_items)

# Thesis section
thesis_items <- c(cvitem("title", "The erroneous use of the Haar wavelet for stock price prediction"),
                  cvitem("supervisor", "Prof. Dr. Marcel Worring"),
                  cvitem("description", 
                          "A critical analysis and replication of a well-cited research paper proposing a combination of wavelet transformation and recurrent neural networks for successful stock prediction. Wavelet transformations can be used in time-series analysis to reduce the noise of the signal, or stock prices specifically. Our research criticizes the use of the Haar wavelet by showing that it is both impossible to use in real-time and the sole reason for the reportedly profitable, yet false, 'predictions' shown by Hsieh et al. [2011]. This error was potentially reproduced in more recent research"))
thesis_section <- NewSection("Master Thesis", items = thesis_items)

# Experience section
experience_items <- c(
  cventry("July 2018 -- Aug 2018", "Freelance python developer", "Ernst \\& Young", "Amsterdam", "",
         latex_itemize(c("Backend web development using the Django web framework built on python and SQLite",
                         "Created new frontend web templates using HTML, css and JavaScript",
                         "Helped finalize the existing project for the first release"))),
  cventry("June 2017 -- June 2018", "Data scientist / Bioinformatician", "TNO: Micro- and Systemsbiology", "Zeist", "Data science for scientific research",
         latex_itemize(c("Standardized statistical analysis",
                         "Many improvements for research standardization and reproducibity",
                         "Shiny applications to make routine tasks accessible to researchers",
                         "A great environment to learn from researchers with widespread backgrounds"))),
  cventry("Feb 2015 -- Feb 2016", "Excel/VBA application developer", "NZA", "Utrecht", "",
         latex_itemize(c("Automated most routine excel tasks using VBA",
                         "Data analysis in R with the saved time",
                         "Unique position in the department"))),
  cventry("Nov 2011 -- July 2015", "Math tutor", "Bijlesnetwerk", "", "", "Teaching mathematics to high school students outside of school"),
  cventry("2012--2013", "Content producer", "Qelp", "", "", "Producing manuals for mobile phones using a standardized process")
)

experience_section <- NewSection("Experience", experience_items)


cv_body <- cat(c("\\maketitle\n\n", education_section, thesis_section, experience_section), sep = "\n\n", file = "input/cv_body_output.tex")

renderpdf("input/cv_body_output.tex", newheader, "cv_output.pdf", dir = "input")
