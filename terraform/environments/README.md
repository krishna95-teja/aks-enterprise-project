aks-enterprise-project/
│
├── terraform/
│   ├── environments/
│   │   ├── dev/
│   │   │   ├── main.tf
│   │   │   ├── variables.tf
│   │   │   └── backend.tf
│   │   └── prod/
│   │       ├── main.tf
│   │       ├── variables.tf
│   │       └── backend.tf
│   │
│   └── modules/
│       ├── aks/
│       ├── acr/
│       └── rg/
│
├── app/
├── k8s/
└── .github/workflows/
