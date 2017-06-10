// Sending line notifications using a binary, docker or Drone CI written in Go (Golang).
//
// Details about the drone-discord project are found in github page:
//
//     https://github.com/appleboy/drone-discord
//
// The pre-compiled binaries can be downloaded from release page.
//
// Send Notification
//
// Setup the --to flag after fetch user id from webhook service.
//
//   drone-discord \
//     --webhook-id xxxx \
//     --webhook-token xxxx \
//     --content "Test Message"
//
// For more details, see the documentation and example.
//
package main
