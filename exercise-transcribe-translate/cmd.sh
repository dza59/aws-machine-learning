aws s3 mb s3://aws-ml-media

aws s3 cp Raf01_320.mov s3://aws-ml-media

aws transcribe start-transcription-job \
 --transcription-job-name attempt01 \
 --media MediaFileUri=s3://aws-ml-media/Raf01_320.mov \
 --language-code pt-BR
 
 
 aws transcribe get-transcription-job \
 --transcription-job-name attempt01 \
 --query TranscriptionJob.Transcript.TranscriptFileUri \
 --output text
 
 
 
 curl $(aws transcribe get-transcription-job \
 --transcription-job-name attempt01 \
 --query TranscriptionJob.Transcript.TranscriptFileUri \
 --output text) > transcribe.json