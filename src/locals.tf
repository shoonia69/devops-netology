locals { 
  web = "netology–${ var.env }–${ var.project }–${ var.role[0] }"
  db = "netology–${ var.env }–${ var.project }–${ var.role[1] }"
}