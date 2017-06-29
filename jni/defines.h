#ifndef DEFINES_H
#define DEFINES_H

#ifndef CASTTOCLASS
#define CASTTOCLASS(CLASSNAME, INFO)	\
	Local<Object> self = INFO.Holder();	\
    Local<External> wrap = Local<External>::Cast(self->GetInternalField(0));	\
	void* ptr = wrap->Value();	\
    CLASSNAME *class_impl =  static_cast<CLASSNAME*>(ptr);
#endif

//#ifndef UChar
//#define UChar unsigned char
//#endif

#include <v8.h>

namespace DCanvas
{
    enum ExceptionType
    {
        TError  = 0,
        TRangeError ,
        TReferenceError ,
        TSyntaxError ,
        TTypeError
    };

    v8::Handle<v8::Value> THROW_EXCEPTION(ExceptionType type, const char *str) ;
	

} // namespace DCanvas

#define RADIAL_VERTEX_NUMBER 72

/*
** Safe delete&release
*/
#ifndef SAFE_DELETE
#define SAFE_DELETE(a) if(a) {	delete a; a = NULL;	}
#endif
#ifndef SAFE_RELEASE
#define SAFE_RELEASE(a) if(a) {	a->release(); a = NULL;	}
#endif
#ifndef SAFE_FREE
#define SAFE_FREE(a) if(a) {	free(a); a = NULL;	}
#endif
#ifndef SAFE_DELETE_ARRAY
#define SAFE_DELETE_ARRAY(a) if(a) {	delete[] a; a = NULL;	}
#endif

#define CLOUDX_SCREEN_WIDTH     480
#define CLOUDX_SCREEN_HEIGHT    800

#ifdef __ANDROID__
#undef LOG_TAG
#undef LOGI
#undef LOGE
#undef LOGD
#include <android/log.h>
#define  LOGI(...)  __android_log_print(ANDROID_LOG_INFO,LOG_TAG,__VA_ARGS__)
#define  LOGE(...)  __android_log_print(ANDROID_LOG_ERROR,LOG_TAG,__VA_ARGS__)
#define  LOGD(...)  __android_log_print(ANDROID_LOG_DEBUG,LOG_TAG,__VA_ARGS__)
#endif

#endif // DEFINES_H
