<%@page expressionCodec="raw" %>
$.extend({}, Uploadr.options, {<g:if test="${handlers.onStart}">onStart: function(file) { ${handlers.onStart} },</g:if><g:if test="${handlers.onProgress}">onProgress: function(file, domObj, percentage) { ${handlers.onProgress} },</g:if><g:if test="${handlers.onSuccess}">onSuccess: function(file, domObj, callback, response) { ${handlers.onSuccess} },</g:if><g:if test="${handlers.onLike}">onLike: function(file, domObj, callback) { ${handlers.onLike} },</g:if><g:if test="${handlers.onUnlike}">onUnlike: function(file, domObj, callback) { ${handlers.onUnlike} },</g:if><g:if test="${handlers.onChangeColor}">onChangeColor: function(file, domObj, color) { ${handlers.onChangeColor} },</g:if><g:if test="${handlers.onFailure}">onFailure: function(file, domObj) {  ${handlers.onFailure}},</g:if><g:if test="${handlers.onAbort}">onAbort: function(file, domObj) {  ${handlers.onAbort}},</g:if><g:if test="${handlers.onView}">onView: function(file, domObj) {  ${handlers.onView}},</g:if><g:if test="${handlers.onView}">onView: function(file, domObj) {  ${handlers.onView}},</g:if><g:if test="${handlers.onDelete}">onDelete: function(file, domObj) {  ${handlers.onDelete}},</g:if>
onDownload: function(file, domObj) { <g:if test="${handlers.onDownload}">${handlers.onDownload}</g:if><g:else>
    // redirect to file, note that the backend should implement
    // authentication and authorization to asure the user has
    // access to this file
    window.open('<g:createLink plugin="uploadr" controller="upload" action="download"/>?uploadr=' + encodeURIComponent('${name}') + '&file='+encodeURIComponent(file.fileName));
</g:else>},
        uri: '${uri}',
<g:if test="${maxVisible}">maxVisible: ${maxVisible},</g:if><g:if test="${maxConcurrentUploads}">maxConcurrentUploads: ${maxConcurrentUploads},</g:if><g:if test="${maxConcurrentUploadsMethod}">maxConcurrentUploadsMethod: '${maxConcurrentUploadsMethod}',</g:if><g:if test="${rating != null}">rating: ${rating as String},</g:if><g:if test="${voting != null}">voting: ${voting as String},</g:if><g:if test="${colorPicker != null}">colorPicker: ${colorPicker as String},</g:if><g:if test="${deletable != null}">deletable: ${deletable as String},</g:if><g:if test="${viewable != null}">viewable: ${viewable as String},</g:if><g:if test="${downloadable != null}">downloadable: ${downloadable as String},</g:if><g:if test="${allowedExtensions}">allowedExtensions: '${allowedExtensions as String}',</g:if><g:if test="${insertDirection}">insertDirection: '${insertDirection}',</g:if>
        id: '${name}',
        files: {<g:each var="file" in="${files}" status="s">
    ${s} : {
                deletable 		: ${file.deletable},
                fileName 		: '${file.name.replaceAll("'","\\\\'")}',
                fileSize 		: ${file.size},
                fileId 			: '${file.id.replaceAll("'","\\\\'")}',
                fileDate 		: ${file.modified}<g:if test="${file.color}">,
                fileColor 		: '${file.color}'</g:if><g:if test="${file.rating}">,
                fileRating 		: ${file.rating}</g:if><g:if test="${file.ratingText}">,
                fileRatingText 	: '${file.ratingText.replaceAll("'","\\\\'")}'</g:if><g:if test="${file.view}">,
                fileInfo 		: [<g:each in="${file.info}" var="info" status="i">
        '${info}'<g:if test="${(i+1) < file.info.size()}">,</g:if></g:each>
        ]</g:if>
    }<g:if test="${(s+1) < files.size()}">,</g:if></g:each>
},
<g:if test="${maxSize}">maxSize: ${maxSize}</g:if>
})