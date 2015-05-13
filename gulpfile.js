var gulp = require('gulp')
var minifyHtml = require('gulp-minify-html')
var minifyInline = require('gulp-minify-inline')

gulp.task('minify:html', function() {
  return gulp.src('./src/index.html')
    .pipe(minifyHtml())
    .pipe(minifyInline())
    .pipe(gulp.dest('./'))
})

gulp.task('default', ['minify:html'])
