<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Grails 3 AWS Uploader</title>

    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
</head>
<body>
    <div id="content" role="main">
        <section class="row colset-2-its">
            <h2>Grails 3 AWS Uploader</h2>
            <g:if test="${flash.message}">
              <div class="message" role="alert">
                ${flash.message}
              </div>
            </g:if>
            <g:uploadForm action="uploadFile" >
              <fieldset>
                <div class="fieldcontain">
                  <input type="file" name="file" />
                </div>
              </fieldset>
              <fieldset>
                <g:submitButton name="uploadbutton" class="save" value="Upload" />
              </fieldset>
            </g:uploadForm>
        </section>
        <section class="row colset-2-its">
          <table>
            <tbody>
              <g:each in="${objects}" var="o" status="s">
                <tr>
                  <td><a href="https://s3-ap-southeast-1.amazonaws.com/djamblog/${o.key}" target="_blank">${o.key}</a></td>
                  <td><g:link action="deleteFile" class="delete" params="[filekey:o.key]">Delete</g:link></td>
                </tr>
              </g:each>
            </tbody>
          </table>
        </section>
    </div>

</body>
</html>
