

#let lead_articles = ("mas2023mutation",
                         "mas2022spectrum",
                         "mas2020dna",
                         "mas2017lncatlas"
                        )

#let confkeys = ("eshg22", "eacr21")

#set page(
  paper: "us-letter",
  margin: 2.1cm,
  footer: [
    #align(center)[
      #text(9pt, weight: "thin")[
        #text("David Mas-Ponte - Curriculum Vitae - Page")
        #counter(page).display()
        #text("- Updated: ")
        #datetime.today().display()
      ]
    ]
  ],
  number-align: center,
)

#let type_author(name, author, prelast: false, last: false) = {
  if (name == author) {
    text(name, weight: "bold")
  } else {
    text(name, weight: "regular")
  }

  if (prelast) {
    text(" & ")
  } else if (last) {
    text("")
  } else {
    text(", ")
  } 
}

#let insert_authors(authorlist, author: "DMP") =       {
        let alength;
        let authors_str;
        
        if (type(authorlist) == "array") {
          alength = authorlist.len()
          for i in range(alength) {
            let name_auth = authorlist.at(i)
            let is_pre_last = alength == (i + 2);
            let is_last = alength == (i + 1);
            type_author(name_auth, author, prelast: is_pre_last, last: is_last)
          }
        } else {
          alength = 1
          type_author(authorlist, author, last: true)
        }
      }


#let insert_works(yamlfn: "test.yaml",
                  author: "Mas-Ponte, David",
                  type: "preprint",
                  leadkeys: ("mas2023mutation")) = {

  let content = yaml(yamlfn)
  let counter = content.len()
  let journals_preprint = ("bioRxiv", "medRxiv", "arXiv")

  for el in content {
    let journal = el.at(1).at("parent").at("title")
    if (type == "preprint" and journals_preprint.contains(journal)) or (type != "preprint" and journal not in journals_preprint) {
      let url = el.at(1).at("url")
      grid(
        columns: (5%, 95%),
        [
            #if (leadkeys.contains(el.at(0))){
              text(str(counter))
              text("*")
            } else {
              text(str(counter))
            }
        ],
        [
          #insert_authors(el.at(1).at("author"), author: author)
          (
            #text(str(el.at(1).at("date")))
          )
          #el.at(1).at("title")
          #text(journal, style: "italic")
          //#chain
          #h(2pt)
          #text(fill: blue)[
            #underline([
                  #link(url)[link]
            ])
          ]
        ] 
      )
    }
    counter = counter - 1
  }
}


#let insert_conferences(yamlfn: "test.yaml",
                  author: "Mas-Ponte, David",
                  talkkeys: ("mas2023mutation")) = {

  let content = yaml(yamlfn)
  let counter = content.len()
  for el in content {
    let url
    let conference = el.at(1).at("parent").at("title")
    if el.at(1).keys().contains("url") {
      let url = text(fill: blue)[
            #underline([
                  #link(el.at(1).at("url"))[link]
            ])
      ] 
    } else {
      let url = []
    }

    grid(
       columns: (15%, 85%),
       [
          #text(str(el.at(1).at("date")))
          #if (talkkeys.contains(el.at(0))){
              text("*")
          }
       ], 
       [
          #el.at(1).at("parent").at("title") (
            #el.at(1).at("parent").at("location")
          )
          
          #url
          
        ]
      )
    }
    counter = counter - 1
  }



#let sectiontitle(title, annotation) = {
  v(5pt)
  grid(columns: (75%, 25%),
      column-gutter: 3pt,
      rows: 1,
      text(15pt, weight: "regular")[#title],
       align(right)[#text(9pt, weight: "thin")[#annotation]]
      )
  v(-10pt)
  line(length: 100%) 
}

#let award(timerange, name, institution, url) = {
  grid(columns: (15%, 65%, 20%),
  [#timerange],
  [
    #align(center)[
      #text(style: "italic")[#name], 
      #institution
    ]
  ],
  [
    //#chain
    #text(fill: blue)[
       #underline([
             #link(url)[website]
       ])
    ]
  ]
)

}

#let item(timerange, name, place) = {
  grid(
  columns: (15%, 85%),
  column-gutter: 3pt,
  row-gutter: 5pt,
  rows: 2,
  align(left)[#timerange],
  align(left)[
    #name
  ],
  align(center)[],
  align(left)[
    #place
  ]
)
}

#let researhsupervision(year, name, type, institution) = {
  grid(
  columns: (15%, 85%),
  column-gutter: 3pt,
  rows: 1,
  align(left)[#year],
  align(left)[
    #name, #type, #text(style: "italic")[#institution]
  ]
)
}


// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


#text(20pt, weight: "bold")[David Mas-Ponte, PhD]

#v(-15pt)
#line(length: 100%)

#set text(11pt)

#grid(
  columns: (70%, 30%),
  row-gutter: 5pt,
  rows: 3,
  [Department of Genome Sciences, University of Washington],
  align(right)[dmas\@uw.edu],
  [Foege Building (S420) - 3720 15th Ave NE],
  align(right)[
    #link("https://david.masponte.com/")[david.masponte.com]
  ],
  [Seattle, WA 98195 (USA)],
  align(right)[
      \@davidmasp - 
      #box(
        height: 9pt,
        image("assets/twitterlogo.svg")
      )
      #box(
        height: 9pt,
        image("assets/github-mark.svg")
      )
    ]
)

#sectiontitle([Academic positions], [\* Current]);

#item(
  [06/2023-\*],
  [Postdoctoral Scholar],
  [
    Kelley Harris lab, Genome Sciences Deptartment, University of Washington
  ])

#item(
  [01-06/2022],
  [Visiting Student Researcher],
  [
    Ashby Morrison lab, Biology Deptartment, Stanford University
  ])

#item(
  [2017-2022],
  [PhD Student],
  [
    Fran Supek lab, Cancer Biology Deptartment, Institute for Research in Biomedicine Barcelona
  ])

#item(
  [2016-2017],
  [MSc Thesis Project],
  [
    Roderic Guigo lab (tutored by Rory Johnson), Bioinformatics Deptartment, Centre for Genomic Regulation
  ])

#sectiontitle([Education], []);

#item(
  [2017-2022],
  [PhD, Biomedicine],
  [
    Universitat de Barcelona, Barcelona, Spain
  ])

#item(
  [2015-2017],
  [
    MSc, Bioinformatics for Health Sciences,
    #text(size: 8pt, weight: "thin")[GPA: 9/10]
  ],
  [
    Universitat Pompeu Fabra, Barcelona, Spain
  ])

#item(
  [2011-2015],
  [
    BS, Biotechnology,
    #text(size: 8pt, weight: "thin")[GPA: 8.5/10]
  ],
  [
    Universitat Autonoma de Barcelona, Spain
  ])

#item(
  [2014],
  [International Exchange Student (undergrad)],
  [
    McGill University, Montreal, Canada
  ])

  #sectiontitle([Preprints and Submitted manuscripts], [\* lead or co-lead author]);

  #insert_works(yamlfn: "dmas.yaml",
                type : "preprint",
                leadkeys: lead_articles)

#block(breakable: false)
  #sectiontitle([Peer-Reviewed Publications], [\* lead or co-lead author]);

  #insert_works(yamlfn: "dmas.yaml",
                type : "peer",
                leadkeys: lead_articles)

#sectiontitle([Conferences], [\* Talks ]);

#insert_conferences(yamlfn: "talks.yaml",
                    talkkeys: confkeys)



#sectiontitle([Research Fellowships], []);


//  funding
// jae intro
// FPI

#item(
  [2017-2022],
  [
    Severo Ochoa - Formacion de Personal Investigador (SO-FPI) Fellowship - BES-2017-079820 -
    #text(fill: blue)[
            #underline([
                  #link("https://www.aei.gob.es/sites/default/files/stfls/eSede/Ficheros/2018/RC_PREDOC_2017.pdf")[website]
            ])
          ]
  ],
  [
    Ministerio de Ciencia
    & Institute for Research in Biomedicine (
    #text(style: "italic")[IRB Barcelona]
    )
    // 
  ])

#item(
  [2015],
  [
    JAE Intro Fellowships (undergraduate research) - 
    #text(fill: blue)[
            #underline([
                  #link("https://jaeintro.csic.es/")[website]
            ])
          ]
  ],
  [
    Consejo Superior de Investigaciones Cientificas (
    #text(style: "italic")[CSIC]
    )
    & Institute for Evolutionary Biology (
    #text(style: "italic")[IBE]
    )
    // 
  ])

#item(
  [2014],
  [
    "Passa l’Estiu al Parc!" Summer Fellowship (undergraduate research) - 
    #text(fill: blue)[
            #underline([
                  #link("https://www.pcb.ub.edu/sobre-la-convocatoria-per-participar-a-la-13a-edicio-de-passa-lestiu-al-parc/")[website]
            ])
          ]
  ],
  [
    Parc Cientific de Barcelona (
    #text(style: "italic")[PCB]
    )
    & Institute Of Molecular Biology of Barcelona (
    #text(style: "italic")[IBMB]
    )
    // 
  ])


 




#sectiontitle([Research Supervision], []);

#researhsupervision(
  [2023-],
  [Yu-Chen Pan],
  [MSc student],
  [U. Washington]
)

// year, name, type, institution
#researhsupervision(
  [2017-2018],
  [Marina Salvadores],
  [MSc student],
  [U. Pompeu Fabra (Bioinformatics)]
)

#sectiontitle([Academic Service & Awards], []);

#award(
  [2021],
  [Best scientific article (finalist)],
  [Societat Catalana de Biologia],
  "https://febs-iubmb-enableconference.org/nmg-2019/"
)

#award(
  [2018-2019],
  [Scientific Organizing Committee],
  ['19 ENABLE Conference (Nijmegen, Netherlands)],
  "https://scb.iec.cat/wp-content/uploads/2021/11/Document_assemblea2021.pdf"
)

Referee for Evolution, Medicine, and Public Health (2023).








