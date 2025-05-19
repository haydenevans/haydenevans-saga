// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import Saga
import SagaParsleyMarkdownReader
import SagaSwimRenderer
import HTML


func renderPage(context: ItemRenderingContext<EmptyMetadata>) -> Node {
  html(lang: "en-US") {
    body {
      div(id: "content") {
        h1 { context.item.title }
        Node.raw(context.item.body)
      }
    }
  }
}


@main
struct Run {
  static func main() async throws {
    try await Saga(input: "content", output: "deploy")
      // All Markdown files within the `input` folder will be parsed to html.
      .register(
        readers: [.parsleyMarkdownReader],
        writers: [.itemWriter(swim(renderPage))]
      )


      // Run the step we registered above
      .run()


      // All the remaining files that were not parsed from markdown, so for example 
      // images, raw html files and css, are copied as-is to the output folder.
      .staticFiles()
  }
}
