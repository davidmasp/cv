


#import emoji: chain


#let trim_authors(authorlist, author, start: 2, end: 2, sep: "...") = {
  
}

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


#let insert_works(yamlfn: "test.yaml") = {
  let content = yaml(yamlfn)
  let counter = content.len()
  for el in content {
    let url = el.at(1).at("url")
    grid(
      columns: (5%, 95%),
      [#counter],
      [
        #insert_authors(el.at(1).at("author"))
        #text(el.at(1).at("date"))
        #el.at(1).at("title")
        #text(el.at(1).at("parent").at("title"), style: "italic")
        #chain
        #text(fill: blue)[
           #underline([
                 #link(url)[link]
           ])
        ]
      ] 
    )
    counter = counter - 1
  }
}

#let sectiontitle(title, annotation) = {
  v(5pt)
  grid(columns: (75%, 25%),
      column-gutter: 3pt,
      rows: 1,
      text(13pt, weight: "regular", font: "Roboto Slab")[#title],
       align(right)[#text(9pt, weight: "thin", font: "Roboto")[#annotation]]
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
    #chain
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

#set text(15pt, weight: "bold", font: "Roboto Slab")

David Mas Ponte
#v(-10pt)
#line(length: 100%)

#set text(12pt, weight: "regular", font: "Roboto")

#grid(
  columns: (50%, 50%),
  row-gutter: 5pt,
  rows: 3,
  [Department of Genome Sciences],
  align(right)[dmas\@uw.edu],
  [University of Washington],
  align(right)[david.masponte.com],
  [Seattle, WA],
  align(right)[\@davidmasp ()]
)

#sectiontitle([Academic position], [\* Current]);

#item(
  [06/2023-],
  [Postdoctoral Scholar\*],
  [
    Kelley Harris lab, Genome Sciences Dept., University of Washington
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
  [MSc, Bioinformatics for Health Sciences],
  [
    Universitat Pompeu Fabra, Barcelona, Spain
  ])

#item(
  [2011-2015],
  [BS, Biotechnology],
  [
    Universitat Autonoma de Barcelona, Spain
  ])

#item(
  [2014],
  [International Exchange Student (undergrad)],
  [
    McGill University, Montreal, Canada
  ])
  
#sectiontitle([Preprints and Submitted manuscripts], []);

#insert_works()

#sectiontitle([Peer-Reviewed Publications], []);


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
  [Scientific Organizing Committee],
  [ENABLE Conference],
  "https://scb.iec.cat/wp-content/uploads/2021/11/Document_assemblea2021.pdf"
)

#award(
  [2018-2019],
  [Best scientific article (finalist)],
  [Societat Catalana de Biologia],
  "https://febs-iubmb-enableconference.org/nmg-2019/"
)



Referee for Evolution xxx (2023).





//  funding
// jae intro
// FPI




