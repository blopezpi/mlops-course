{{/*
Expand the name of the chart.
*/}}
{{- define "breast_cancer.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "breast_cancer.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "breast_cancer.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "breast_cancer.labels" -}}
helm.sh/chart: {{ include "breast_cancer.chart" . }}
{{ include "breast_cancer.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "breast_cancer.selectorLabels" -}}
app.kubernetes.io/name: {{ include "breast_cancer.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "breast_cancer.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "breast_cancer.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}


{{/*
Mongo selector Labels
*/}}
{{- define "breast_cancer.mongo.selectorLabels" -}}
app.kubernetes.io/name: "mongo"
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Mongo fullname
*/}}
{{- define "breast_cancer.mongo.fullname" -}}
{{- if .Values.mongo.fullnameOverride }}
{{- .Values.mongo.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "mongo" }}
{{- end }}
{{- end }}


{{/*
Common labels mongo
*/}}
{{- define "breast_cancer.mongo.labels" -}}
helm.sh/chart: {{ include "breast_cancer.chart" . }}
{{ include "breast_cancer.mongo.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}