# generateCertificate

A simple bash script to generate a course or event certificates based on a SVG template.

## Use
./generateCertificate.sh fileWithParticipantsNames stringWitTheParticipantRole

## Example

Assuming the file input.txt contains the names of the participants of an event,
we can generate certificates seting they as listneres of the event

./generateCertificate.sh input.txt listener

This way the PDF files with the certificate for each participant will be
saved at the certificatsFolder.

