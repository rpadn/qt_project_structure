#ifndef MODULE2_GLOBAL_H
#define MODULE2_GLOBAL_H

#include <QtGlobal>

#if defined(MODULE2_LIBRARY)
#  define MODULE2_EXPORT Q_DECL_EXPORT
#else
#  define MODULE2_EXPORT Q_DECL_IMPORT
#endif

#endif // MODULE2_GLOBAL_H
