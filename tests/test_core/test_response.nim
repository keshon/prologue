from ../../src/prologue/core/response import initResponse, setHeader, addHeader, setCookie
import ../../src/prologue/core/httpcore/httplogue

import strutils


# "Test Response"
block:
  let
    version = HttpVer11
    code = Http200
    body = "<h1>Hello, Prologue!</h1>"

  # "can init response"
  block:
    let
      response = initResponse(version, code, body = body)

    doAssert response.httpVersion == version
    doAssert response.code == code
    doAssert response.headers["Content-Type"] == "text/html; charset=UTF-8"
    doAssert response.body == body

  # "can set response header"
  block:
    var
      response = initResponse(version, code, body = body)

    response.setHeader("Content-Type", "text/plain")

    doAssert response.headers["content-type"] == "text/plain"

  # "can add response header"
  block:
    var
      response = initResponse(version, code, body = body)

    response.addHeader("Content-Type", "text/plain")

    doAssert seq[string](response.headers["CONTENT-TYPE"]) == @[
          "text/html; charset=UTF-8", "text/plain"]

  # "can set response cookie"
  block:
    var
      response = initResponse(version, code, body = body)

    response.setCookie("username", "flywind")
    response.setCookie("password", "root")
    doAssert seq[string](response.headers["set-cookie"]).join("; ") ==
          "username=flywind; SameSite=Lax; password=root; SameSite=Lax"
